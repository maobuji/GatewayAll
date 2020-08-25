 curl  http://172.18.100.71:8080/apisix/admin/routes/c1beea9e-914f-4476-8d75-0ddb97d7c2f3 -X PUT --data "@post.txt" -v

将以下文件内容放到post.txt文件中
{
	"name": "web_test",
	"protocols": ["http", "https", "websocket"],
	"hosts": ["172.18.100.71"],
	"paths": ["/test/*"],
	"methods": ["GET", "HEAD", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"],
	"upstream_protocol": "keep",
	"upstream_id": "45ccff7a-3788-48d3-9d7c-409b62a0283c",
	"plugins": {
		"kafka-logger": {
			"batch_max_size": 1000,
			"broker_list": {
			    "192.168.5.21":9092
			},
			"buffer_duration": 60,
			"inactive_timeout": 5,
			"include_req_body": true,
			"max_retry_count": 0,
			"name": "kafka logger",
			"retry_delay": 1,
			"timeout": 3,
			"kafka_topic": "test",
			"key": "key1"
		}
	},
	"uris": ["/test/*"],
	"vars": [],
	"upstream_header": {},
	"upstream_path": {
		"to": "/"
	}
}