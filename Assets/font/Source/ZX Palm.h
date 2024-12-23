// ZX Palm font from https://damieng.com/zx-origins
#ifndef ZX_PALM_H_
#define ZX_PALM_H_

#include <stdint.h>

static const uint8_t FONT_ZX_PALM_BITMAP[] = {
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, //   
	0x10, 0x10, 0x10, 0x10, 0x10, 0x00, 0x10, 0x00, // ! 
	0x28, 0x28, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, // " 
	0x14, 0x14, 0x7e, 0x28, 0xfc, 0x50, 0x50, 0x00, // # 
	0x3c, 0x50, 0x50, 0x38, 0x14, 0x14, 0x78, 0x00, // $ 
	0x44, 0xa4, 0xa8, 0x54, 0x2a, 0x4a, 0x44, 0x00, // % 
	0x18, 0x24, 0x28, 0x10, 0x2a, 0x44, 0x3a, 0x00, // & 
	0x10, 0x10, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, // ' 
	0x08, 0x10, 0x20, 0x20, 0x20, 0x10, 0x08, 0x00, // ( 
	0x20, 0x10, 0x08, 0x08, 0x08, 0x10, 0x20, 0x00, // ) 
	0x00, 0x28, 0x10, 0x6c, 0x10, 0x28, 0x00, 0x00, // * 
	0x00, 0x08, 0x08, 0x3e, 0x08, 0x08, 0x00, 0x00, // + 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x20, // , 
	0x00, 0x00, 0x00, 0x3c, 0x00, 0x00, 0x00, 0x00, // - 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, // . 
	0x04, 0x04, 0x08, 0x10, 0x10, 0x20, 0x20, 0x00, // / 
	0x18, 0x24, 0x24, 0x24, 0x24, 0x24, 0x18, 0x00, // 0 
	0x08, 0x18, 0x08, 0x08, 0x08, 0x08, 0x08, 0x00, // 1 
	0x18, 0x24, 0x04, 0x08, 0x10, 0x20, 0x3c, 0x00, // 2 
	0x18, 0x24, 0x04, 0x08, 0x04, 0x24, 0x18, 0x00, // 3 
	0x04, 0x0c, 0x14, 0x24, 0x3c, 0x04, 0x04, 0x00, // 4 
	0x3c, 0x20, 0x20, 0x38, 0x04, 0x04, 0x38, 0x00, // 5 
	0x08, 0x10, 0x20, 0x38, 0x24, 0x24, 0x18, 0x00, // 6 
	0x3c, 0x04, 0x08, 0x08, 0x10, 0x10, 0x10, 0x00, // 7 
	0x18, 0x24, 0x24, 0x18, 0x24, 0x24, 0x18, 0x00, // 8 
	0x18, 0x24, 0x24, 0x1c, 0x04, 0x08, 0x10, 0x00, // 9 
	0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, // : 
	0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x20, // ; 
	0x00, 0x04, 0x18, 0x60, 0x18, 0x04, 0x00, 0x00, // < 
	0x00, 0x00, 0x38, 0x00, 0x38, 0x00, 0x00, 0x00, // = 
	0x00, 0x20, 0x18, 0x06, 0x18, 0x20, 0x00, 0x00, // > 
	0x38, 0x04, 0x08, 0x10, 0x10, 0x00, 0x10, 0x00, // ? 
	0x38, 0x44, 0x9a, 0xaa, 0x94, 0x40, 0x38, 0x00, // @ 
	0x18, 0x24, 0x24, 0x3c, 0x24, 0x24, 0x24, 0x00, // A 
	0x38, 0x24, 0x24, 0x38, 0x24, 0x24, 0x38, 0x00, // B 
	0x0c, 0x10, 0x20, 0x20, 0x20, 0x10, 0x0c, 0x00, // C 
	0x38, 0x24, 0x22, 0x22, 0x22, 0x24, 0x38, 0x00, // D 
	0x38, 0x20, 0x20, 0x38, 0x20, 0x20, 0x38, 0x00, // E 
	0x38, 0x20, 0x20, 0x38, 0x20, 0x20, 0x20, 0x00, // F 
	0x1c, 0x20, 0x40, 0x4c, 0x44, 0x24, 0x1c, 0x00, // G 
	0x24, 0x24, 0x24, 0x3c, 0x24, 0x24, 0x24, 0x00, // H 
	0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, // I 
	0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x30, 0x00, // J 
	0x44, 0x48, 0x50, 0x60, 0x50, 0x48, 0x44, 0x00, // K 
	0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x38, 0x00, // L 
	0xc6, 0xc6, 0xaa, 0xaa, 0xaa, 0x92, 0x92, 0x00, // M 
	0x44, 0x64, 0x54, 0x54, 0x4c, 0x44, 0x44, 0x00, // N 
	0x18, 0x24, 0x42, 0x42, 0x42, 0x24, 0x18, 0x00, // O 
	0x38, 0x24, 0x24, 0x38, 0x20, 0x20, 0x20, 0x00, // P 
	0x18, 0x24, 0x42, 0x42, 0x42, 0x24, 0x18, 0x06, // Q 
	0x38, 0x24, 0x24, 0x38, 0x28, 0x24, 0x24, 0x00, // R 
	0x1c, 0x20, 0x20, 0x18, 0x04, 0x04, 0x38, 0x00, // S 
	0x7c, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, // T 
	0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x38, 0x00, // U 
	0x44, 0x44, 0x44, 0x28, 0x28, 0x10, 0x10, 0x00, // V 
	0x92, 0x92, 0xaa, 0xaa, 0x44, 0x44, 0x44, 0x00, // W 
	0x44, 0x44, 0x28, 0x10, 0x28, 0x44, 0x44, 0x00, // X 
	0x44, 0x44, 0x28, 0x10, 0x10, 0x10, 0x10, 0x00, // Y 
	0x7c, 0x04, 0x08, 0x10, 0x20, 0x40, 0x7c, 0x00, // Z 
	0x18, 0x10, 0x10, 0x10, 0x10, 0x10, 0x18, 0x00, // [ 
	0x20, 0x20, 0x10, 0x08, 0x08, 0x04, 0x04, 0x00, // \ (backslash) 
	0x18, 0x08, 0x08, 0x08, 0x08, 0x08, 0x18, 0x00, // ] 
	0x10, 0x10, 0x28, 0x28, 0x44, 0x00, 0x00, 0x00, // ^ 
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7e, // _ 
	0x1c, 0x20, 0x20, 0x78, 0x20, 0x20, 0x7c, 0x00, // £ 
	0x00, 0x00, 0x1c, 0x24, 0x24, 0x24, 0x1c, 0x00, // a 
	0x20, 0x20, 0x38, 0x24, 0x24, 0x24, 0x38, 0x00, // b 
	0x00, 0x00, 0x18, 0x20, 0x20, 0x20, 0x18, 0x00, // c 
	0x04, 0x04, 0x1c, 0x24, 0x24, 0x24, 0x1c, 0x00, // d 
	0x00, 0x00, 0x18, 0x24, 0x3c, 0x20, 0x1c, 0x00, // e 
	0x0c, 0x10, 0x38, 0x10, 0x10, 0x10, 0x10, 0x00, // f 
	0x00, 0x00, 0x1c, 0x24, 0x24, 0x1c, 0x04, 0x18, // g 
	0x20, 0x20, 0x38, 0x24, 0x24, 0x24, 0x24, 0x00, // h 
	0x10, 0x00, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, // i 
	0x08, 0x00, 0x08, 0x08, 0x08, 0x08, 0x08, 0x10, // j 
	0x20, 0x20, 0x24, 0x28, 0x30, 0x28, 0x24, 0x00, // k 
	0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, // l 
	0x00, 0x00, 0xec, 0x92, 0x92, 0x92, 0x92, 0x00, // m 
	0x00, 0x00, 0x38, 0x24, 0x24, 0x24, 0x24, 0x00, // n 
	0x00, 0x00, 0x18, 0x24, 0x24, 0x24, 0x18, 0x00, // o 
	0x00, 0x00, 0x38, 0x24, 0x24, 0x38, 0x20, 0x20, // p 
	0x00, 0x00, 0x1c, 0x24, 0x24, 0x1c, 0x04, 0x04, // q 
	0x00, 0x00, 0x28, 0x30, 0x20, 0x20, 0x20, 0x00, // r 
	0x00, 0x00, 0x18, 0x20, 0x10, 0x08, 0x30, 0x00, // s 
	0x10, 0x10, 0x38, 0x10, 0x10, 0x10, 0x08, 0x00, // t 
	0x00, 0x00, 0x24, 0x24, 0x24, 0x24, 0x1c, 0x00, // u 
	0x00, 0x00, 0x44, 0x28, 0x28, 0x10, 0x10, 0x00, // v 
	0x00, 0x00, 0x54, 0x54, 0x54, 0x28, 0x28, 0x00, // w 
	0x00, 0x00, 0x44, 0x28, 0x10, 0x28, 0x44, 0x00, // x 
	0x00, 0x00, 0x22, 0x14, 0x14, 0x08, 0x10, 0x20, // y 
	0x00, 0x00, 0x38, 0x08, 0x10, 0x20, 0x38, 0x00, // z 
	0x08, 0x10, 0x10, 0x20, 0x10, 0x10, 0x08, 0x00, // { 
	0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00, // | 
	0x20, 0x10, 0x10, 0x08, 0x10, 0x10, 0x20, 0x00, // } 
	0x00, 0x00, 0x32, 0x4c, 0x00, 0x00, 0x00, 0x00, // ~ 
	0x38, 0x44, 0xba, 0xa2, 0xba, 0x44, 0x38, 0x00, // © 
};

#endif
