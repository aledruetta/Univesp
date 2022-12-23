fn main() {
    let a: i32 = 11;
    let b = &a;
    println!("{}, {}", a, b);

    let c = String::from("Alejandro");
    let d = &c;
    println!("{}", d);

    let e = "Druetta";
    say_hello_static(e);
    say_goodbye_static(e);

    let f = "Druetta".to_string();
    say_hello_dynamic(&f);
    say_goodbye_dynamic(f);
}

fn say_hello_static(t: &str) {
    println!("Hello, {t}!");
}

fn say_goodbye_static(t: &str) {
    println!("Goodbye, {t}!");
}

fn say_hello_dynamic(t: &String) {
    println!("Hello, {t}!");
}

fn say_goodbye_dynamic(t: String) {
    println!("Goodbye, {t}!");
}
