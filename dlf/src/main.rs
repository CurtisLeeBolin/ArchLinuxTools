use std::process::Command;
use std::{env, thread, time};

fn main() {
    let args: Vec<String> = env::args().collect();
    let user_agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36)";
    let filename = &args[1];
    let url = &args[2];

    let status = Command::new("curl")
        .arg("--location")
        .arg("--fail")
        .arg("--user-agent")
        .arg(user_agent)
        .arg("--output")
        .arg(filename)
        .arg(url)
        .status()
        .expect("failed to execute process");

    if !status.success() {
        let mut while_status = true;
        while while_status {
            let status = Command::new("curl")
                .arg("-C")
                .arg("-")
                .arg("--location")
                .arg("--fail")
                .arg("--user-agent")
                .arg(user_agent)
                .arg("--output")
                .arg(filename)
                .arg(url)
                .status()
                .expect("failed to execute process");
            if status.success() {
                while_status = false;
            } else {
                thread::sleep(time::Duration::from_secs(5));
                println!();
            }
        }
    }
}
