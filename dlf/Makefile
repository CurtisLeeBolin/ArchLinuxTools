build:
	cargo build --release
	strip target/release/dlf

install:
	cp target/release/dlf ~/.local/bin/

clean:
	rm -r target
	rm Cargo.lock

all: build install clean
