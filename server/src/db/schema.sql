-- Schema for signum-edu Database  

CREATE TABLE rooms (  
    id SERIAL PRIMARY KEY,  
    name VARCHAR(255) NOT NULL,  
    capacity INT NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
);  

CREATE TABLE lessons (  
    id SERIAL PRIMARY KEY,  
    title VARCHAR(255) NOT NULL,  
    description TEXT,  
    room_id INT REFERENCES rooms(id),  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
);  

CREATE TABLE phrases (  
    id SERIAL PRIMARY KEY,  
    content TEXT NOT NULL,  
    lesson_id INT REFERENCES lessons(id),  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
);  

CREATE TABLE users (  
    id SERIAL PRIMARY KEY,  
    username VARCHAR(255) UNIQUE NOT NULL,  
    password_hash VARCHAR(255) NOT NULL,  
    email VARCHAR(255) UNIQUE NOT NULL,  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
);  

CREATE TABLE stt_metrics (  
    id SERIAL PRIMARY KEY,  
    user_id INT REFERENCES users(id),  
    lesson_id INT REFERENCES lessons(id),  
    accuracy DECIMAL(5, 2),  
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);  
