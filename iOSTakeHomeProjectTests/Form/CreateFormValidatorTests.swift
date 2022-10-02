//
//  CreateFormValidatorTests.swift
//  iOSTakeHomeProjectTests
//
//  Created by Justin on 10/1/22.
//

import XCTest
@testable import iOSTakeHomeProject

final class CreateFormValidatorTests: XCTestCase {
    
    private var validator: CreateValidator!
    
    override func setUp() {
        validator = CreateValidator()
    }
    
    override func tearDown() {
        validator = nil
    }
    
    func test_with_empty_person_first_name_error_thrown() {
        let person    = NewPerson()
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty First Name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Wrong type of error. Expecting a 'Create Validator' error")
                return
            }
            
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidFirstName, "Expecting an error where we have an invalid First Name")
        }
    }
    
    func test_with_empty_first_name_error_thrown() {
        
        let person = NewPerson(lastName: "El", job: "iOS Dev")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty First Name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Wrong type of error. Expecting a 'Create Validator' error")
                return
            }
            
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidFirstName, "Expecting an error where we have an invalid First Name")
        }
    }
    
    func test_with_empty_last_name_error_thrown() {
        let person = NewPerson(firstName: "Jay", job: "iOS Dev")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty Last Name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Wrong type of error. Expecting a 'Create Validator' error")
                return
            }
            
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidLastName, "Expecting an error where we have an invalid Last Name")
        }
    }
    
    func test_with_empty_job_error_thrown() {
        let person = NewPerson(firstName: "Jay", lastName: "El")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty Job should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Wrong type of error. Expecting a 'Create Validator' error")
                return
            }
            
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidJob, "Expecting an error where we have an invalid Job")
        }
        
    }
    
    func test_with_valid_person_error_not_thrown() {
        
        let person = NewPerson(firstName: "Jay", lastName: "El", job: "iOS Dev")
        
        
        do {
            _ = try validator.validate(person)
        } catch {
            XCTFail("No errors should be thrown since the person is a valid object")
        }
    }
}
