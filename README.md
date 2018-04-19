<b>Line-Calculator</b></br>

Your task is to implement class Line Calculator. All methods in class should be support dot notation.</br>
The priority of different operations should be kept in mind. It means, that 2 + 2 * 2 is 6, not 8.</br>

<b>Details:</b></br>
  - create class LineCalculator
  - init class default value (number)
  - add methods:
    1. add(number) 
    2. subtract(number) 
    3. multiply(number)
    4. devide(number) 
    5. pow(number)
  - when we use Line Calculator with NSlog() method, method should be print current result
  - use MRC
  
<i>Example: </i></br>
    LineCalculator *calc = [LineCalculator defaultValue:@2]; </br>
    calc.add(@2).multiply(@2); </br>
    NSLog(@"%@", calc); // should be print 6 </br>
    
<b>Test Data:</b></br>
LineCalculator *calc = [LineCalculator defaultValue:@10];</br>
calc.add(83); -> 93</br>

LineCalculator *calc = [LineCalculator defaultValue:@4];</br>
calc.pow(1).pow(1).pow(1).multiply(2).add(80).subtract(11).multiply(1).subtract(41).subtract(65); -> -29</br>

LineCalculator *calc = [LineCalculator defaultValue:@6];</br>
calc.add(14).subtract(16).add(36).multiply(1).subtract(46).add(57).pow(1); -> 51</br>

LineCalculator *calc = [LineCalculator defaultValue:@10];</br>
calc.pow(1).pow(1); -> 10</br>

LineCalculator *calc = [LineCalculator defaultValue:@7];</br>
calc.subtract(94).subtract(97).multiply(1).pow(1).multiply(1).pow(1).subtract(65).pow(1); -> -249</br>

LineCalculator *calc = [LineCalculator defaultValue:@7];</br>
calc.subtract(43).subtract(43).multiply(1).subtract(60).add(8).subtract(28); -> -159</br>
