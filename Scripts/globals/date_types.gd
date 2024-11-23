class_name DataTypes

enum Tools{ #使用枚举类型定义工具
	None,
	AxeWood,
	TillGround,
	WaterCrops,
	PlantCorn,
	PlantTomato
}

enum GrowthStates{
	Seed,#手上的种子
	Germination,#种下去的种子
	Vegetative,#发芽
	Reproduction,#成熟一点
	Maturity,#成熟
	Harvesting,#收获
}
