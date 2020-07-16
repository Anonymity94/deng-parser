Expression
  = prefix:(__ '1' __ '*' __ '2') __ op:ComputeSign __ number:(Decimal / Integer) __ {
  console.log('number', number)
    if(op === '+') { return 2 + number }
    if(op === '-') { return 2 - number }
    if(op === '*') { return 2 * number }
    if(op === '/') { return 2 / number }
  }
  
ComputeSign "请输入运算符号：+ 、-、* 、/" = '+' / '-' / '*' / '/'

Integer "第三位数字请输入整数"
  = [0-9]+ { return parseInt(text(), 10); }
  
Decimal "第三位数字请输入小数，最多支持2位小数" 
  = '0.' int:Integer {
  	console.log('int', int)
  	if(String(int).length >= 3) {
      throw Error('第三位数字最多支持2位小数')
    }
    return Number(text())
  }

__ = [ ]*
