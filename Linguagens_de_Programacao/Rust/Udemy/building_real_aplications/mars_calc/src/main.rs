use std::io;

fn main() {
    let mut input = String::new();

    io::stdin()
        .read_line(&mut input);

    borrow_string(&input);
    own_string(input);

    // println!("Input: {}", input);
    // let mars_weight = calculate_weight_on_mars(78.0);
    // println!("Weight on Mars: {}gr", mars_weight * 1000.0);
}

fn calculate_weight_on_mars(earth_weigth: f32) -> f32 {
    (earth_weigth / 9.81) * 3.711
}

fn own_string(s: String) {
    println!("{}", s);
}

fn borrow_string(s: &String) {
    println!("{}", s);
}
