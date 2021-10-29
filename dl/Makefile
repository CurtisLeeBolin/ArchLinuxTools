build:
	cargo build --release
	strip target/release/dl

install:
	cp target/release/dl ~/.local/bin/

clean:
	rm -r target
	rm Cargo.lock

all: build install clean
