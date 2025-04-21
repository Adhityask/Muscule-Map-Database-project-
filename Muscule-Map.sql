-- ==========================================================
-- DATABASE: my_project
-- DESCRIPTION: Gym Management SQL Schema with Sample Data
-- Author: AK
-- Date: 2025-04-21
-- ==========================================================

-- ======================
-- TABLE: certification
-- ======================
DROP TABLE IF EXISTS certification;

CREATE TABLE certification (
    certification_id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO certification (certification_id, name) VALUES
(101, 'ACE Certified'),
(102, 'CPR & First Aid'),
(103, 'Nutrition Expert');

-- ======================
-- TABLE: trainer

-- ======================
DROP TABLE IF EXISTS trainer;

CREATE TABLE trainer (
    trainer_id INT PRIMARY KEY,
    name VARCHAR(50),
    experience VARCHAR(50),
    specialty VARCHAR(50)
);

INSERT INTO trainer (trainer_id, name, experience, specialty) VALUES
(1, 'Jordan Smith', '5 years', 'Weightlifting'),
(2, 'Emily Davis', '3 years', 'Cardio');

-- ==========================================
-- TABLE: trainer_certification (Many-to-Many)
-- ==========================================
DROP TABLE IF EXISTS trainer_certification;

CREATE TABLE trainer_certification (
    trainer_id INT NOT NULL,
    certification_id INT NOT NULL,
    PRIMARY KEY (trainer_id, certification_id),
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id),
    FOREIGN KEY (certification_id) REFERENCES certification(certification_id)
);

INSERT INTO trainer_certification (trainer_id, certification_id) VALUES
(1, 101),
(1, 102),
(2, 102),
(2, 103);

-- ======================
-- TABLE: member
-- ======================
DROP TABLE IF EXISTS member;

CREATE TABLE member (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    trainer_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id)
);

INSERT INTO member (member_id, name, age, gender, trainer_id) VALUES
(201, 'Alex Johnson', 25, 'Male', 1),
(202, 'Sara Lee', 28, 'Female', 2),
(203, 'Michael Chen', 32, 'Male', 1);

-- ========================
-- TABLE: membership (1:1)
-- ========================
DROP TABLE IF EXISTS membership;

CREATE TABLE membership (
    membership_id INT PRIMARY KEY,
    member_id INT UNIQUE,
    start_date DATE,
    end_date DATE,
    type VARCHAR(50),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

INSERT INTO membership (membership_id, member_id, start_date, end_date, type) VALUES
(301, 201, '2025-01-01', '2025-06-30', 'Premium'),
(302, 202, '2025-02-01', '2025-07-31', 'Standard'),
(303, 203, '2025-03-01', '2025-08-31', 'Premium');

-- ============================
-- DATA IMPORT COMPLETED 
-- ============================
