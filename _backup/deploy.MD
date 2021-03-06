version: "3.3"
services:
    elasticsearch: 
        image:  elasticsearch:${ELASTIC_STACK_VERSION}
        container_name: elasticsearch
        environment: 
            - node.name=es-master
            - cluster.name=docker-elasticsearch
            - discovery.type=single-node     #单节点模式
            - http.cors.enabled=true         #允许跨域访问
            - http.cors.allow-origin=*
            - bootstrap.memory_lock=true     # 锁内存
            - "ES_JAVA_OPTS=${ES_JVM_OPTS}"  # 设置ES启动时JVM参数
            - TAKE_FILE_OWNERSHIP=true       #设置ES有权直接访问主机目录
        ports:
            - "9200:9200"
        expose: 
            - "9200"
        restart: always
        ulimits:
            memlock:
                soft: -1
                hard: -1
        volumes:
            - ${ES_DATA_DIR}:/usr/share/elasticsearch/data:rw
            - ${ES_LOGS_DIR}:/usr/share/elasticsearch/logs:rw
        networks: 
            - elastic
    kibana:
        image: kibana:${ELASTIC_STACK_VERSION}
        container_name: kibana
        depends_on:
            - elasticsearch
        environment:
            - ELASTICSEARCH_HOSTS=http://elasticsearch:9200
            - I18N_LOCALE=zh-CN
            - KIBANA_DEFAULTAPPID=discover
        ports:
            - "5601:5601"
        networks:
            - elastic
    zookeeper:
        image: zookeeper:3.5.5
        restart: always
        container_name: zookeeper
        ports:
            - "2182:2181"
        expose:
            - "2181"
        environment:
            ZOO_MY_ID: 1
        networks:
            - elastic
    kafka:
        image: wurstmeister/kafka:2.12-2.2.1
        restart: always
        container_name: kafka
        environment:
            - KAFKA_BROKER_ID=1
            - KAFKA_LISTENERS=PLAINTEXT://${KAFKA_HOSTNAME}:9090
            - KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://${KAFKA_HOSTNAME}:9090
            - KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181
            - KAFKA_MESSAGE_MAX_BYTES=2000000
           #- KAFKA_CREATE_TOPICS=${KAFKA_BOOTSTRAP_CREATE_TOPICS}
            - KAFKA_HEAP_OPTS=${KAFKA_JVM_OPTS}
        ports:
            - "9090:9090"
        hostname: ${KAFKA_HOSTNAME}
        volumes:
            - ${KAFKA_DATA_DIR}:/kafka
        expose:
            - "9090"
        depends_on:
            - zookeeper
        networks:
            - elastic
    kafka-manager:
        image: sheepkiller/kafka-manager
        container_name: kafka-manager
        ports:
            - "${KAFKA_MANAGER_PORT}:9000"
        environment:
            ZK_HOSTS: zookeeper:2181
            APPLICATION_SECRET: "admin"
        depends_on:
            - zookeeper
            - kafka
        networks:
            - elastic
    logstash:
        image: logstash:${ELASTIC_STACK_VERSION}
        container_name: logstash
        ports:
            - "9600:9600"
        extra_hosts:
            - "${KAFKA_HOSTNAME}:${LOCALHOST_IP}"
        environment:
            - XPACK_MONITORING_ENABLED=true
            - LOG_LEVEL=info
            - PIPELINE_WORKERS=${LOGSTASH_PIPELINE_WORKERS}
            - TAKE_FILE_OWNERSHIP=true
            - LS_JAVA_OPTS=${LS_JAVA_OPTS}
        volumes:
            - ./logstash-pipeline/:/usr/share/logstash/pipeline/:rw
        depends_on:
            - zookeeper
            - kafka
            - elasticsearch
        networks:
            - elastic
networks:
    elastic: 
        driver: bridge