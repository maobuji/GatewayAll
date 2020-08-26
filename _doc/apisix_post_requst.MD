curl  http://172.18.100.71:8080/apisix/admin/routes/c1beea9e-914f-4476-8d75-0ddb97d7c2f3 -X PUT --data "@post.txt" -v
curl  http://172.18.100.71:8080/apisix/admin/routes/4b74fc10-6446-4787-9ba4-9406f6933c21 -X PUT --data "@post.txt" -v
将以下文件内容放到post.txt文件中
{
	"name": "webtest",
	"desc": "webtest",
	"protocols": ["http", "https"],
	"hosts": ["172.18.100.71"],
	"paths": ["/webtest/*"],
	"methods": ["GET", "HEAD", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"],
	"upstream_protocol": "keep",
	"plugins": {
		"kafka-logger": {
			"batch_max_size": 1000,
			"broker_list": {
			    "192.168.5.21":9092
			},
			"buffer_duration": 60,
			"inactive_timeout": 5,
			"include_req_body": false,
			"kafka_topic": "webtest",
			"key": "test1",
			"max_retry_count": 0,
			"name": "kafka logger",
			"retry_delay": 1,
			"timeout": 3
		}
	},
	"uris": ["/webtest/*"],
	"vars": [],
	"upstream": {
		"type": "roundrobin",
		"nodes": {
			"172.18.100.71:9081": 10
		},
		"timeout": {
			"connect": 6000,
			"send": 6000,
			"read": 6000
		}
	},
	"upstream_header": {},
	"upstream_path": {
		"to": "/*"
	}
}