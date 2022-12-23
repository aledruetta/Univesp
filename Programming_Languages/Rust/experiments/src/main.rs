fn fun() -> bool {
    let cond = 5 > 3;
    if cond {
        println!("5 is greatest than 3");
    }
    cond
}

fn main() {
    if fun() {
        println!("This is the end, my friend...");
    }
}
