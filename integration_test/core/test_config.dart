// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class TestConfig {
  // //todo: Read from pipe-line config
// const String PROJECT_KEY = 'TZS'; //Get from Jira

// //todo: Read from pipe-line config
// const String CYRCLE_KEY = 'TZS-R9'; //Get from Zephyr Scale

// //todo: Read from system environment
// const String TOKEN =
//     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb250ZXh0Ijp7ImJhc2VVcmwiOiJodHRwczovL3h1YW50aGFuaHRzZC5hdGxhc3NpYW4ubmV0IiwidXNlciI6eyJhY2NvdW50SWQiOiI3MDEyMTowODM0NTYxYy1kZTE5LTQwYjQtYjM3Yi0yYjhlNDY0NGEwNTcifX0sImlzcyI6ImNvbS5rYW5vYWgudGVzdC1tYW5hZ2VyIiwic3ViIjoiMWRlZjZlMDUtYzMwZi0zNDRjLWIyN2QtNmVmYTMzYzE5MGE4IiwiZXhwIjoxNzIzNzEzNjQ4LCJpYXQiOjE2OTIxNzc2NDh9.Ku1tXva3FAQvHwhJbrH8wrOCHX1WXekDTJiLzQ-ohhg';

  String PROJECT_KEY = 'EZRX'; //Get from Jira
// const String CYCLE_KEY = 'EZRX-R5'; //Get from Zephyr Scale
  String TOKEN =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJjb250ZXh0Ijp7ImJhc2VVcmwiOiJodHRwczovL3p1ZWxsaWdwaGFybWEuYXRsYXNzaWFuLm5ldCIsInVzZXIiOnsiYWNjb3VudElkIjoiNzEyMDIwOjA1NWRmODQ2LTVhN2QtNDY2Zi1hYmRjLWYwOTliOGVmMmI3NSJ9fSwiaXNzIjoiY29tLmthbm9haC50ZXN0LW1hbmFnZXIiLCJzdWIiOiIxYjAzYzNmNy02YTUzLTNkOWQtYjdmNy04NDE5YTJjZDE5ZDAiLCJleHAiOjE3MzgxMjM5NjMsImlhdCI6MTcwNjU4Nzk2M30.-aufWytGvqtsmz2zEQ8pfuddI2mXDpwQu-Vri8HeFXo';

  String STEP_URL =
      'https://api.zephyrscale.smartbear.com/v2/testcases/{ID}/teststeps';
  String EXECUTION_URL =
      'https://api.zephyrscale.smartbear.com/v2/testexecutions';
}
