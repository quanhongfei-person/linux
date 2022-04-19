/*
 * adc.h
 *
 *  Created on: Aug 27, 2018
 *      Author: linux
 */

#ifndef ADC_H_
#define ADC_H_

#define ADCCON *(unsigned int *)0x126c0000
#define ADCDLY *(unsigned int *)0x126c0008
#define ADCDAT *(unsigned int *)0x126c000c
#define CLRINTADC *(unsigned int *)0x126c0018
#define ADCMUX *(unsigned int *)0x126c001c
#define IESR2 *(unsigned int *)0x10440020
#define ISTR2 *(unsigned int *)0x10440028
#endif /* ADC_H_ */
