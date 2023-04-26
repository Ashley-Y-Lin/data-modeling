CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
    UNIQUE (first_name, last_name)
);

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    departure_time TIMESTAMP WITH TIME ZONE NOT NULL,
    arrival_time TIMESTAMP WITH TIME ZONE NOT NULL
        CHECK (arrival_time > departure_time),
    from_city VARCHAR(50) NOT NULL,
    from_country VARCHAR(50) NOT NULL,
    to_city VARCHAR(50) NOT NULL,
    to_country VARCHAR(50) NOT NULL
        CHECK (from_city <> to_city AND from_country <> to_country),
    airline_id INTEGER NOT NULL REFERENCES airlines
);

CREATE TABLE passengers_flights (
    id SERIAL PRIMARY KEY,
    passenger_id INTEGER NOT NULL REFERENCES passengers,
    flight_id INTEGER NOT NULL REFERENCES flights,
    seat_num INTEGER NOT NULL
        CHECK (seat_num < 50),
    aisle_letter VARCHAR(1) NOT NULL
        CHECK (aisle_letter IN ('A', 'B', 'C', 'D', 'E', 'F'))
);

INSERT INTO airlines (name)
    VALUES
        ('United'),
        ('British Airways'),
        ('Delta'),
        ('TUI Fly Belgium'),
        ('Air China'),
        ('American Airlines'),
        ('Avianca Brasil');

INSERT INTO passengers (first_name, last_name)
    VALUES
        ('Jennifer', 'Finch'),
        ('Thadeus', 'Gathercoal'),
        ('Sonja', 'Pauley'),
        ('Waneta', 'Skeleton'),
        ('Berkie', 'Wycliff'),
        ('Alvin', 'Leathes'),
        ('Cory', 'Squibbes'),
        ('Hamish', 'O''Reilly'),
        ('Eileen', 'O''Reilly');

INSERT INTO flights (departure_time, arrival_time, from_city, from_country)