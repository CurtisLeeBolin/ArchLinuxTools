use std::process::Command;
use std::{env, thread, time};

fn main() {
    let args: Vec<String> = env::args().collect();
    let user_agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36)";
    let urls_string = &args[1];
    let urls: Vec<_> = urls_string.split_whitespace().collect();

    for url in urls.iter() {
        //let mut while_status = true;
        //while while_status {
        println!("{}", url);
            let status = Command::new("curl")
                .arg("-C")
                .arg("-")
                .arg("--location")
                .arg("--fail")
                .arg("--remote-name-all")
                .arg("--user-agent")
                .arg(user_agent)
                .arg(url)
                .status()
                .expect("failed to execute process");
        /*
            if status.success() {
                while_status = false;
            } else {
                thread::sleep(time::Duration::from_secs(5));
                println!();
            }
        }
        */
    }
}
