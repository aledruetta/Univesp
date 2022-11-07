fn main() {
    let x = 5;
    let y = x;

    println!("{x}, {y}");

    let s1 = String::from("hello");
    let s2 = s1.clone();

    println!("{s1}, {s2}");

    let a1 = [0; 5];
    let a2 = a1;

    println!("{}, {}", a1[0], a2[0]);

    let letra = '✊';
    println!("{}", letra.len_utf8());

    let numbers = (1, 2, 3.4);
    let (a, b, c) = numbers;
}
