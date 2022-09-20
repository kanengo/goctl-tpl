
func (m *default{{.upperStartCamelObject}}Model) Delete(ctx context.Context, {{.lowerStartCamelPrimaryKey}} {{.dataType}}) error {
	{{.keys}}
	err := 	m.ExecCtx(ctx, func(ctx context.Context, conn *gorm.DB) error {
		query := fmt.Sprintf("delete from %s where {{.originalPrimaryKey}} = {{if .postgreSql}}$1{{else}}?{{end}}", m.table)
		if err := conn.WithContext(ctx).Exec(query, {{.lowerStartCamelPrimaryKey}}).Error; err != nil {
			return err
		}

		return nil
	}, {{.keyValues}})
	return err
}
