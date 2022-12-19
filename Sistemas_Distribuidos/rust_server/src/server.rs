use std::{net::TcpListener, io::Read};

pub struct Server {
    addr: String,
}

impl Server {
    pub fn new(addr: String) -> Self {
        Self { addr }
    }

    pub fn run(self) {
        let listener = TcpListener::bind(&self.addr).unwrap();

        println!("Listening on {}...", self.addr);

        loop {
            match listener.accept() {
                Err(e) => println!("Failed to establish a connection: {}", e),
                Ok((mut stream, _)) => {
                    let mut buffer = [0; 1024];
                    stream.read(&mut buffer);
                },
            }
        };
    }
}
