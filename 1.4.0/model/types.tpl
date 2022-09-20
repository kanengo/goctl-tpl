
type (
	{{.lowerStartCamelObject}}Model interface{
		{{.method}}
	}

	default{{.upperStartCamelObject}}Model struct {
		sqlc.CachedConn
		table string
	}

	{{.upperStartCamelObject}} struct {
		{{.fields}}
	}
)

