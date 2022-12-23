use std::io::{self, Write};

fn main() {
    let mut input = String::new();

    print!("Enter you weight (kg)? ");
    io::stdout().flush().unwrap();
    io::stdin()
        .read_line(&mut input)
        .unwrap();

    let weight: f32 = input.trim().parse().unwrap();
    let mars_weight = calculate_weight_on_mars(weight);
    println!("Weight on Mars: {}kg", mars_weight);
}

fn calculate_weight_on_mars(earth_weigth: f32) -> f32 {
    (earth_weigth / 9.81) * 3.711
}
