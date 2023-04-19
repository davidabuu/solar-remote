CREATE DATABASE SolarDatabase
USE SolarDatabase
GO
CREATE SCHEMA SolarAppSchema    
GO
-- Registration Table For Users
CREATE TABLE SolarAppSchema.UserRegistration(
    UserId INT IDENTITY(1,1),     
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    EmailAddress NVARCHAR(20),
    PasswordHash VARBINARY(MAX),
    PasswordSalt VARBINARY(MAX),
    PhoneNumber VARCHAR(20),
    Latitude DECIMAL (9,6),
    Longitude DECIMAL (9,6),
    IsVerified BIT DEFAULT 0

)
-- Registration Table For Admin
CREATE TABLE SolarAppSchema.AdminRegistration(
    AdminId INT IDENTITY(1,1),     
    EmailAddress NVARCHAR(20),
    AdminRole VARCHAR(10) DEFAULT 'Admin'
)
-- Table For Solar Panel Details 
CREATE TABLE SolarAppSchema.SolarDetails(
    SolarId INT IDENTITY(1,1),     
    GetDate DATE,
    GetCurrent DECIMAL (5,2),
    Voltage DECIMAL (5,2),
    Radiance DECIMAL (5,2),
    GetStatus BIT DEFAULT 0,
    UserId INT
)

GO
-- Sql Script to Verify a User
CREATE OR ALTER PROCEDURE spUserVerification
@UserId INT,
@EmailAddress NVARCHAR(20)
AS
BEGIN
IF EXISTS(SELECT * FROM SolarAppSchema.AdminRegistration WHERE EmailAddress = @EmailAddress )
BEGIN
UPDATE SolarAppSchema.UserRegistration
SET IsVerified = 1
WHERE UserId = @UserId
END
ELSE
SELECT 'Unauthorized'
END
GO
-- SQL Script to Register A User
CREATE OR ALTER PROCEDURE spUserRegistration
@FirstName VARCHAR(20),
@LastName VARCHAR(20),
@PhoneNumber VARCHAR(20),
@PasswordHash VARBINARY(MAX),
@PasswordSalt VARBINARY(MAX),
@Latitude DECIMAL (9,6),
@Longitude DECIMAL (9,6),
@EmailAddress NVARCHAR(20)
AS
BEGIN
IF NOT EXISTS(SELECT * FROM SolarAppSchema.UserRegistration WHERE EmailAddress = @EmailAddress)
BEGIN
INSERT INTO SolarAppSchema.UserRegistration(
[FirstName],
[LastName],
[PhoneNumber],
[PasswordHash],
[PasswordSalt],
[EmailAddress],
[Latitude],
[Longitude] 
)VALUES(@FirstName, @LastName,@PhoneNumber,@PasswordHash,@PasswordSalt,@EmailAddress, @Latitude, @Longitude)
END
ELSE 
BEGIN
SELECT 'User with that Email Already Exists'
END
END
GO
-- Procedure That will add The Solar Details
CREATE OR ALTER PROCEDURE spSolarDetailsPerUser
@UserId INT,
@GetDate DATE,
@GetCurrent DECIMAL (5,2),
@Voltage DECIMAL (5,2),
@Radiance DECIMAL (5,2),
@GetStatus BIT
AS
BEGIN
DECLARE @is_Verfied BIT
SELECT @is_Verfied  = IsVerified FROM SolarAppSchema.UserRegistration WHERE UserId = UserId
IF @is_Verfied = 1
BEGIN
IF EXISTS(SELECT * FROM SolarAppSchema.UserRegistration WHERE UserId = @UserId)
BEGIN
INSERT INTO SolarAppSchema.SolarDetails(
[UserId],
[GetDate],
[GetCurrent],
[Voltage],
[Radiance],
[GetStatus]
)VALUES(@UserId, @GetDate, @GetCurrent, @Voltage, @Radiance, @GetStatus) 
END
ELSE 
SELECT 'User is not found'
END
ELSE
BEGIN
SELECT 'User is Not Verified'
END
END
GO
-- Get User Details Complete
CREATE OR ALTER PROCEDURE spGetUserDetails
@UserId INT
AS
BEGIN
IF EXISTS(SELECT * FROM SolarAppSchema.UserRegistration WHERE UserId = @UserId)
BEGIN
SELECT  * FROM SolarAppSchema.UserRegistration AS UserRegistration
LEFT JOIN  SolarAppSchema.SolarDetails AS UserSolarDetails
ON UserRegistration.UserId = UserSolarDetails.UserId
END
END


GO

-- ->Procedure for Login Confirmation for User
CREATE OR ALTER PROCEDURE spLoginUserConfirmation
@EmailAddress NVARCHAR(20)
AS
BEGIN
SELECT * FROM SolarAppSchema.UserRegistration WHERE EmailAddress = @EmailAddress
END