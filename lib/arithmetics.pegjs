Expression
  = head:Term tail:(_ ("+" / "-") _ Term)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "+") { return result + element[3]; }
        if (element[1] === "-") { return result - element[3]; }
      }, head);
    }

Term
  = head:Factor tail:(_ ("*" / "/") _ Factor)* {
      return tail.reduce(function(result, element) {
        if (element[1] === "*") { return result * element[3]; }
        if (element[1] === "/") { return result / element[3]; }
      }, head);
    }

Factor "请输入数字"
  = "(" _ expr:Expression _ ")" { return expr; }
  / Decimal
  / Integer

Integer "integer"
  = _ [0-9]+ { return parseInt(text(), 10); }

Decimal 
  = '0.' int:Integer {
    return Number(text())
  }

_ "whitespace"
  = [ \t\n\r]*