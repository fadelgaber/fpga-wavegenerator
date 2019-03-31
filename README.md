**Introduction**

The purpose of this laboratory is to build a simple Direct Digital Synthesiser (DDS) using a top-down approach, starting from the clock delay circuits and ending with the DAC (which is used as a parallel to serial converter).

This DDS will be used to output a sinusoid _sin(x) + sin(3x)_ to an oscilloscope. This code is loaded onto a Nexys-3 FPGA and output is achieved through an external DAC chip (PMOD DAC).

**Clock Dividers**

3 clock divider circuits are used to divide the main clock of the FPGA that runs at 100MHz to create a clock signal for other components.

DIV8: Divides the clock by 8 and is used to drive the phase accumulator, DAC interface and debouncer.

DIV16: Divides the clock by 16 and is used to drive the CE signal which acts as an enable pin for the phase accumulator and DAC interface. Unlike the DIV 8 circuit, this circuit and the DIV4096 circuit output a single pulse once the counter is reached (16).

DIV4096: Divides the clock by 4096.

First pulse at 40960ns.

**Debounce Circuit**

This circuit is used to ensure proper operation of the circuit so that there are no asynchronous glitches. It is a combination of two D flip flops that delay the CLR signal by a clock cycle.

**Phase Accumulator Circuit**

Four switch sliders are used to program the output frequency of the phase accumulator. This is done by creating a vector of 4 bits which is added to the output of the phase accumulator.

On the rising edge of the clock cycle, and if CE is high, a 16 bit output vector is output, the 4 bit vector is then added to the 16 bit output vector and the resulting vector is output during the next cycle.

**Wave Generator Circuit**

This circuit takes the first five bits from the 16 bit phase accumulator output (starting from LSB) and uses them in a multiplexer logic to output the sinusoidal waveform.

Five bits means that the sinusoid is divided into 25 parts. Every part is programmed to produce a specific 12 bit HEX code when encountered. This is done via a lookup table made in Excel.

**DAC Interface Circuit**

This circuit takes the 12 bit output of the wave generator and adds it to a 4 bit setup vector (used to tell the DAC chip what settings to use) to produce a 16 bit output vector.

The MSB of this output vector is output every clock cycle. The CE signal is used to &quot;prepare&quot; the circuit for output, which in my code means that the 16 bit vector is constructed once CE is high. The vector is output through two channels DATA\_1 and DATA\_2.

**CAD1 Circuit**

This is the top-level circuit which encompasses all of the previously mentioned components together to create a single entity with 3 inputs and 4 outputs.

Phase accumulator starts working once CE is high. DAC Interface starts working once CE becomes low.

**Summary**

Three clock dividers are used to divide the main clock. DIV8 is used to drive the CLK signal and DIV16 to drive the CE signal which is used as an enable signal. The phase accumulator adds its output to a SHIFTER input (set by the switches on the FPGA) and uses this to drive the wave generator. The wave generator takes in the phase accumulator&#39;s input, and uses the first 5 bits to output the corresponding HEX code which is set up using a LUT(32 values of the sinusoid curve). This HEX value is send to the DAC Interface which adds a 4bit setup header and outputs the binary number serially.
