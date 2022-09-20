
func (*{{.upperStartCamelObject}}) TableName() string {
	return {{.table}}
}

func new{{.upperStartCamelObject}}Model(conn *gorm.DB{{if .withCache}},  c *redis.Client, cacheTtl time.Duration{{end}}) *default{{.upperStartCamelObject}}Model {
	return &default{{.upperStartCamelObject}}Model{
		{{if .withCache}}CachedConn: sqlc.NewConnWithCacheTimeout(conn, c, cacheTtl){{else}}CachedConn: sqlc.NewConnWithCacheTimeout(conn, nil, 0){{end}},
		table:      {{.table}},
	}
}
