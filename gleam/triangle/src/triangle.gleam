fn is_triangle(a: Float, b: Float, c: Float) {
  a >. 0.0
  && b >. 0.0
  && c >. 0.0
  && a +. b >=. c
  && b +. c >=. a
  && a +. c >=. b
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b && b == c }
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b || b == c || a == c }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a != b && b != c && a != c }
}
