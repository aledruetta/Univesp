// > poker init
// Nombre? Alejandro
// Creaste la sesión: 34Ty8a
// HDU [1]? Crear filtros
// Cuántos puntos de historia estimas para la HDU [1]: 9
// Ya han estimado todos en el equipo? y
// ...
//
// > poker play
// Nombre? Gonzalo
// Token? 34Ty8a
// Te has unido a la sesión: 34Ty8a
// HDU [1]: Crear filtros
// Cuántos puntos de historia estimas para la HDU [1]: 15
// Ya han estimado todos en el equipo? y
//
// Tu equipo estimó para [1]:
// José      18
// Gonzalo   15
// Casandra  10
// Alejandro 9

use rand::distributions::Alphanumeric;
use rand::{thread_rng, Rng};
use term::Terminal;
use std::io::{Write, Stdout};
use std::{env, io};

const TOKEN_SIZE: usize = 6;

fn main() {
    let mut t = term::stdout().unwrap();

    t.fg(term::color::YELLOW).unwrap();

    let _args: Vec<String> = env::args().collect();

    poker_init(&mut t);

    t.reset().unwrap();
}

fn create_token() -> String {
    thread_rng()
        .sample_iter(&Alphanumeric)
        .take(TOKEN_SIZE)
        .map(char::from)
        .collect()
}

fn poker_init(t: &mut Box<dyn Terminal<Output = Stdout> + Send>) {
    prompt(t, "Nombre? ");

    let mut name = String::new();

    io::stdin().read_line(&mut name).expect("Error!");

    let token = create_token();

    prompt(t, "Creaste la sesión: ");

    writeln!(t, "{token}").unwrap();

    t.fg(term::color::YELLOW).unwrap();

    writeln!(t, "Comparte el token con los miembros del equipo.").unwrap();

    let _ = io::stdout().flush();
}

fn prompt(t: &mut Box<dyn Terminal<Output = Stdout> + Send>, text: &str) {
    t.fg(term::color::YELLOW).unwrap();

    write!(t, "{text}").unwrap();

    t.fg(term::color::GREEN).unwrap();

    let _ = io::stdout().flush();
}
