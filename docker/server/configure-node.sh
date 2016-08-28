set -m

/entrypoint.sh couchbase-server &

sleep 15

# Setup index and memory quota
curl -v -X POST http://127.0.0.1:8091/pools/default -d memoryQuota=300 -d indexMemoryQuota=300

# Setup services
curl -v http://127.0.0.1:8091/node/controller/setupServices -d services=kv%2cn1ql%2Cindex

# Setup credentials
curl -v http://127.0.0.1:8091/settings/web -d port=8091 -d username=Administrator -d password=password

# Setup Memory Optimized Indexes
curl -i -u Administrator:password -X POST http://127.0.0.1:8091/settings/indexes -d 'storageMode=memory_optimized'

# Load travel-sample bucket
curl -v -u Administrator:password -X POST http://127.0.0.1:8091/pools/default/buckets -d name=fx-example -d bucketType=couchbase -d ramQuotaMB=256 -d authType=sasl

# Create primary index on bucket
sleep 10
curl -v http://127.0.0.1:8093/query/service -d 'statement=create primary index on fx-example'

fg 1
