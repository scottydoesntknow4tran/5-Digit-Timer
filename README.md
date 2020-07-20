# 5-Digit-Timer
Verilog code for a 5-digit up/down timer with asynchronous loading, pausing, and base 2-16 counting

This timer has 5 digits which requires 6 iterations of the Cntr_stage_m file which counts the ticks of the clock and sends the terminal count signal to the enable of the next stage which then causes the counting
The hex7seg file is used to decode the counter signals into the 7-segment led display. It is able to count in Binary all the way to Hexidecimal becuase of the use of the Base parameter which allow for one change in the code to change the way the how project keeps time.
There is also a cool feature in the hex7seg file that allows for the first digit to be blanked out when the count is below ten. (instead of sitting at zero)
Thhere is a test bench that test the code in modelsim.
The modified cntstage allows for the up/down counting, change of base, and loading of starting values using flip switches
