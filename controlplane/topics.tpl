{
    "topics": [
        {
        	"name": "accounts",
		"partitions_count" : 7,
		"cleanup_policy" : "delete"
        },
	{
        	"name": "transactions",
		"partitions_count" : 7,
		"cleanup_policy" : "compact"
        },
	{
        	"name": "superman",
		"partitions_count" : 7,
		"cleanup_policy" : "compact"
        }
    ]
}
