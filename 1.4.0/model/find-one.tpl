
func (m *default{{.upperStartCamelObject}}Model) FindOne(ctx context.Context, {{.lowerStartCamelPrimaryKey}} {{.dataType}}) (*{{.upperStartCamelObject}}, error) {
	{{.cacheKey}}
	var resp {{.upperStartCamelObject}}

	err := m.FindOneCtx(ctx,  &resp, {{.cacheKeyVariable}}, func(ctx context.Context, conn *gorm.DB, v interface{}) error {
		err := conn.Where("{{.originalPrimaryKey}} = ?", {{.lowerStartCamelPrimaryKey}} ).First(&resp).Error
		if err != nil {
			return err
		}
		return nil
	})

	if err != nil {
		return nil, err
	}

	return &resp, err
}
