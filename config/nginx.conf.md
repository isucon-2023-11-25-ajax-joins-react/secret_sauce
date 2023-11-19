# /etc/nginx/nginx.confの設定メモ

## アクセスログのフォーマット設定
etc/nginx/nginx.confのhttp {} の中で↓を入れる

```
log_format json escape=json '{"time":"$time_iso8601",'
                            '"host":"$remote_addr",'
                            '"port":"$remote_port",'
                            '"method":"$request_method",'
                            '"uri":"$request_uri",'
                            '"status":"$status",'
                            '"body_bytes":"$body_bytes_sent",'
                            '"referer":"$http_referer",'
                            '"ua":"$http_user_agent",'
                            '"request_time":"$request_time",'
                            '"response_time":"$upstream_response_time"}';
```
