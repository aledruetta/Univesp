fn main() {
    for number in (1..4).rev() {
        println!("{number}");
    }

    let mut s1 = "string";

    println!("{}", s1);

    s1 = "another string";

    println!("{}", s1);

    let mut s2 = String::from("hello");

    s2.push_str(", world!");

    println!("{}", s2);
}
