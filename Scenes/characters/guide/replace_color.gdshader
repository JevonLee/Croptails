shader_type canvas_item;

uniform vec4 original_0:source_color;//需要检测和替换的“原始颜色”
uniform vec4 original_1:source_color;//提示 Godot 将这些变量显示为颜色选择器

uniform vec4 replace_0:source_color;//替换的目标颜色
uniform vec4 replace_1:source_color;

const float precision = 0.1;
//原始颜色与像素颜色的允许差距，值越小，替换匹配越严格

vec4 replace_color(vec4 color){
	//将原始颜色和替换颜色分别存储在 vec4[2] 数组中。
	vec4 original_colors[2] = vec4[2](original_0,original_1);
	vec4 replace_colors[2] = vec4[2](replace_0,replace_1);
	
	//如果距离小于或等于 precision，认为颜色匹配，将该像素颜色替换为对应的 replace_colors[i]。
	for(int i=0;i<2;i++){
		if(distance(color,original_colors[i])<=precision){
			color = replace_colors[i];
		}
	}
	return color;
}

void fragment() {
	COLOR=replace_color(texture(TEXTURE,UV));
}
