// > poker -ij Alejandro
//   34Ty8a
// > poker -j Gonzalo -t 34Ty8a
//   You joined session 34Ty8a
// > poker -h 1 -p 15
//   You estimate that user story 1 has 15 story points
// > poker -h 1
//   Wait until everybody had estimate
// > poker -h 1
//   José      18
//   Gonzalo   15
//   Casandra  10
//   Alejandro 9

use rand::{thread_rng, Rng};
use rand::distributions::Alphanumeric;

const TOKEN_SIZE: usize = 6;

fn main() {
    let token = create_token();

    println!("{token}");
}

fn create_token() -> String {
    thread_rng()
        .sample_iter(&Alphanumeric)
        .take(TOKEN_SIZE)
        .map(char::from)
        .collect()
}
