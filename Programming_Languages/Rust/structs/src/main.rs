fn main() {
    let mut user = User {
        age: 32,
        active: true,
        username: String::from("jdoo"),
        email: String::from("jdoo@gmail.com"),
    };

    user.email.push_str(".ar");

    print_user(user);

    let user = build_user(String::from("doojoo"), String::from("dooj@uol.com.br"), 76);

    print_user(user);
}

struct User {
    active: bool,
    username: String,
    email: String,
    age: u32,
}

fn build_user(username: String, email: String, age: u32) -> User {
    User {
        username,
        email,
        age,
        active: true,
    }
}

fn print_user(user: User) {
    println!(
        "active: {}, username: {}, email: {}, age: {}.",
        user.active, user.username, user.email, user.age
    );
}
