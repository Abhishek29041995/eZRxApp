package com.zuelligpharma.ezrxplus;

 import androidx.test.rule.ActivityTestRule;
 import dev.flutter.plugins.integration_test.FlutterTestRunner;
 import org.junit.Rule;
 import org.junit.runner.RunWith;

 import com.zuelligpharma.ezrxplus.MainActivity;

 @RunWith(FlutterTestRunner.class)
 public class MainActivityTest {
   @Rule
   public ActivityTestRule<MainActivity> rule = new ActivityTestRule<>(MainActivity.class, true, false);
 }
