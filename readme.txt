==============================================
Manual for using the matrix_module vhdl driver
By Ivan Brajinovic
02.06.2021
==============================================

This driver was created because I couldn't find any usefull code on the internet on the 8x8 LED matrix module.

Inputs:
	binComb - 64 bit binary combination in which 1 signals that the LED should be on, 0 that the LED should be off
	CP - clock pulse, I hope that you know what this is
Outputs:
	rowComb - 3 bit binary combination that represents the row in which the required LED is
	colComb - 3 bit binary combination that represents the collum in which the required LED is
	works - one bit that if set to 0 enables the LED module, or if set to 1 disables the module

The way this module will work is:
	add something like this to your code after including the driver in your project
		matrix_driver: entity work.matrix_module port map(binComb, CP, rowComb, colComb, works)

The way I use the driver is i go to: https://xantorohara.github.io/led-matrix-editor/ and create my pixel image.
Then I take the hex code that is generated and convert it to binary: https://www.rapidtables.com/convert/number/hex-to-binary.html
Beware, when you convert it to binary, the zeros(0) from the beggining of the binary combination will dissapear so you need to add zeros(0) at the beggining until you have a 64 bit binary combination.

That binary combination becomes the binComb input for the driver.

The code was written for the circuit located in the following pdf: https://repozitorij.etfos.hr/islandora/object/etfos%3A1341/datastream/PDF/view
