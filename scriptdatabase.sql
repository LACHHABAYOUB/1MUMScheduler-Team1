- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema swe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema swe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `swe` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `swe` ;

-- -----------------------------------------------------
-- Table `swe`.`blocks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`blocks` (
  `id` INT NOT NULL,
  `date` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swe`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`courses` (
  `id` INT NOT NULL,
  `code` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swe`.`faculty_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`faculty_tbl` (
  `id` INT NOT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `phonenumber` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swe`.`entry_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`entry_tbl` (
  `id` INT NOT NULL,
  `entry_date` DATE NULL DEFAULT NULL,
  `fpp` INT NOT NULL,
  `fppcpt` INT NOT NULL,
  `fppopt` INT NOT NULL,
  `mpp` INT NOT NULL,
  `mppcpt` INT NOT NULL,
  `mppopt` INT NOT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `faculty_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKoqow2h5avy4lvkburx69wi923` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `FKoqow2h5avy4lvkburx69wi923`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `swe`.`faculty_tbl` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swe`.`hibernate_sequence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`hibernate_sequence` (
  `next_val` BIGINT NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swe`.`schedules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`schedules` (
  `id` BIGINT NOT NULL,
  `status` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swe`.`sections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`sections` (
  `id` BIGINT NOT NULL,
  `capacity` INT NULL DEFAULT NULL,
  `room_location` VARCHAR(255) NULL DEFAULT NULL,
  `course_id` INT NULL DEFAULT NULL,
  `faculty_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK7ty9cevpq04d90ohtso1q8312` (`course_id` ASC) VISIBLE,
  INDEX `FKb2jh4f8nerfu0i6brmtkguf4i` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `FK7ty9cevpq04d90ohtso1q8312`
    FOREIGN KEY (`course_id`)
    REFERENCES `swe`.`courses` (`id`),
  CONSTRAINT `FKb2jh4f8nerfu0i6brmtkguf4i`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `swe`.`faculty_tbl` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swe`.`student_tbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`student_tbl` (
  `id` INT NOT NULL,
  `default_password` VARCHAR(255) NULL DEFAULT NULL,
  `age` INT NOT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `firstname` VARCHAR(255) NULL DEFAULT NULL,
  `lastname` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `swe`.`sections_students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `swe`.`sections_students` (
  `section_id` BIGINT NOT NULL,
  `students_id` INT NOT NULL,
  INDEX `FKjsp3yuh6osobwbkdvkbjr0ik5` (`students_id` ASC) VISIBLE,
  INDEX `FKhi2i46937yq0hgccq5ikcoo6v` (`section_id` ASC) VISIBLE,
  CONSTRAINT `FKhi2i46937yq0hgccq5ikcoo6v`
    FOREIGN KEY (`section_id`)
    REFERENCES `swe`.`sections` (`id`),
  CONSTRAINT `FKjsp3yuh6osobwbkdvkbjr0ik5`
    FOREIGN KEY (`students_id`)
    REFERENCES `swe`.`student_tbl` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
