fn main() {
    let s = String::from("hello world");

    let hello = slice1(&s);
    println!("{}", hello);

    let hello = slice2(&s);
    println!("{}", hello);

    let s = "my string literal";

    let hello = slice2(&s);
    println!("{}", hello);

    slice3();
}

fn slice1(s: &String) -> String {
    String::from(&s[0..=4])
}

fn slice2(s: &str) -> &str {
    &s[0..=4]
}

fn slice3() {
    let mut a = [1, 2, 3, 4, 5];

    a[1] = 66;

    let s = &a[1..3];

    // a[1] = 99;       // error: cannot assign to `a[_]` because it is borrowed

    for item in s {
        println!("{}", item);
    }
}
