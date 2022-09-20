
func (m *default{{.upperStartCamelObject}}Model) Insert(ctx context.Context, data *{{.upperStartCamelObject}}) error {
	{{.keys}}
	
	err := m.ExecCtx(ctx, func(ctx context.Context, conn *gorm.DB) error{
		if err := conn.Create(data).Error; err != nil {
			return err
		}

		return nil
	}, {{.keyValues}})

	return err
}
