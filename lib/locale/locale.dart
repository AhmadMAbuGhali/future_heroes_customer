import 'package:get/get.dart';

class MyLocale extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "login": "تسجيل الدخول",
          "changeDisplayLang": "تغيير لغة العرض ",
          "next": "التالي",
          "skip": "تخطي",
          "onBoardingText1": "تفوق طفلك مسؤوليتنا",
          "onBoardingBody1":
              "الاستمرار بالتمرين يصنع منك شخص من حديد يتمتع بكامل النشاط والحيوية .. ويساعد ذهنك على التركيز على جميع نواحي حياتك اليومية",
          "onBoardingText2": "صناعة ابطال المستقبل",
          "onBoardingBody2":
              "الكثير من الأنشطة منها خدمة كرة السلة والقدم ، التايكواندو، التيكوﻧﺟﺗﺳو، البوﻛﺳﯾﻧﺞ، الجمباز",
          "onBoardingText3": "نساعدك لتحقيق الهدف",
          "onBoardingBody3":
              "ليست مجرد لكمات وركلات🥋 نحن نصنع أفضل نسخة من طفلك💪 ابطال2021 على مستوى المملكة",
          "email": "البريد الالكتروني",
          "password": "كلمة المرور",
          "rememberMe": "تذكرني",
          "forgotPassword": "نسيت كلمة المرور؟",
          "dontHaveAccount": "ليس لديك حساب ؟ ",
          "makeAccount": " أنشئ حسابك الآن",
          "emailOrPasswordError": "البريد الإلكتروني أو كلمة المرور غير صحيحة",
          "helloUser": "مرحبا بك , يوسف الجزار",
          "helloAgain": "مرحبا بك من جديد",
          "areYouReady": "هل انت جاهز للبدء",
          "goToHome": "إتجه للصفحة الرئيسية",
          "register": "انشئ حسابك",
          "haveAccount": "لديك حساب ؟ ",
          "tryLogin": " قم بالدخول الى حسابك",
          "thisEmailRegister": "هذا الإيميل مسجل بالفعل",
          "completeRegister": "مرحبا بك , قم باكمال عملية التسجيل",
          "welcome": " !اهلا وسهلا بك",
          "whatCategory": "الى أي فئة ترغب الانضمام",
          "sport": "رياضي",
          "cultural": "ثقافي",
          "continue": "متابعة",
          "Karate": "كاراتيه",
          "Gymnastics": "جمباز",
          "taekwondo": "تايكوندو",
          "drawing": "رسم",
          "font": "خط",
          "Sculpture": "نحت",
          "termsAndConditions": "الشروط والاحكام",
          "Instructions": "تعليمات وشروط  يجب على المشترك في الصالة التقيد بها",
          "termBody": '''
 1- الالتزام بالزي الرياضي الكامل .
 2- الحفاظ على نظافة الصالة .
 3- يمنع دخول الوجبات داخل الصالة.
 4- عدم اصطحاب الأطفال . 
 5- في حالة عدم التقيد بالنظام والآداب الإسلامية في الصالة يحق للصالة  إلغاء العضوية نهائياً وعدم استرجاع مبلغ الاشتراك .
 6- رسوم عضوية الاشتراك غير قابلة للاسترجاع نهائياً في أي حال من الأحوال وفي حالة عدم تسديد رسوم التجديد في موعدها تعتبر العضوية منتهية .
 7- في حالة الاشتراك وعدم الحضور يكون الاشتراك ساري المفعول ولا يتوقف إلا في حالة إبلاغ أدارة المركز , ويعتبر الاشتراك بعد انتهاء المدة منتهي الصلاحية .
 8- لا يحق تبديل الاشتراك لأي فرد آخر وفي حالة عدم رغبة المشترك في الاستمرار في أي حال من الأحوال لا يسترجع المبلغ نهائياً .
 9- يحق للعميل إيقاف اشتراكه لمدة 2 حصص تدريبية باشتراك الشهر , و6 حصص تدريبية باشتراك الثلاث اشهر .
 10- لإيقاف الاشتراك يجب التواصل مع إدارة المركز بإرسال رسالة أو اتصال .
 11- يحق للمركز تصوير الحصص التدريبية للمشتركين أثناء التدريب ونشرها على حسابات التواصل الاجتماعي الخاصة بالمركز ''',
           "agreeTerm": "أوافق على جميع الشروط والأحكام",
          "mandatoryField": "هذا الحقل مطلوب اجباري",
          "personalDetails": "البيانات الشخصية",
          "userName": "اسم المشترك ",
          "DOB": "تاريخ الميلاد",
          "mobileNumber": "رقم الهاتف",
          "changePhoto": "تغيير الصورة الشخصية",
          "openCamera": "افتح الكاميرا",
          "openGallery": "اختر من معرض الصور",
          "or": "أو",
          "weAreClose": "لقد شارفنا على الانتهاء",
          "tellUsDiseases": "اذا كنت تعاني من بعض الامراض اخبرنا بذلك",
          "iHaveDiseases": "اعاني من بعض الامراض",
          "iDontHaveDisease": "كلا , انا سليم وخالي من الامراض",
          "choseDisease": "اختر من القائمة نوع المرض",
          "diabetes": "السكري",
          "pressure": "الضغط",
          "anemia": "فقر الدم",
          "muscleTear": "تمزق عضلي",
          "heartDisease": "أمراض القلب",
          "other": "أخرى",
          "choseCoach": "اختيار المدرب",
          "choseFavCoach": "اختر من القائمة , المدرب الذي ترغب بالانضمام لطلابه",
          "sportSection": "قسم الرياضة",
          "culturalSection": "قسم الثقافي",
          "coach1": " المدرب محمد",
          "coach2": "المدرب خالد",
          "coach3": "مدرب أحمد",
          "coachClassDay": "الحصص الخاصة ب الكوتش محمد",
          "ClassDays": "السبت/االاثنين/الاربعاء",
          "availableTime": "مواعيد الحصص المتاحة",
          "availableTimeHint": "اختر الوقت المناسب",
          "lastStep": "بقيت خطوة اخيرة",
          "chosePackage": "اختر الباقة  المناسبة لك",
          "month": "شهر واحد",
          "month2": "شهرين",
          "month3": "ثلاث شهور",
          "packageDetails": "يتم سرد تفاصيل الاشتراك هنا",
          "RS": "ريال سعودي",
          "orderUnderReview": "طلبك قيد التدقيق , من الإدارة يرجى التوجه لمقر النادي, لتثبيت الاشتراك في اقرب وقت",
          "moveToLogin": "اتجه لتسجيل الدخول",
          "didYouForgotPassword": "هل فقدت كلمة المرور؟",
          "sentVerification": "ارسل رمز التحقق",
          "codeWasSend": "الكود قد تم إرساله إلى الإيميل",
          "enterCode":"ادخل رمز التحقق",
          "sendCodeAgain": "يمكنك طلب إعادة ارسال الرمز خلال",
          "seconds": "ثانية",
          "verification": "تحقق",
          "typeNewPassword": "أدخل كلمة المرور الجديدة",
          "retypePassword": "اعد كتابة كلمة المرور",
          "passwordReset": "اعادة تعيين كلمة المرور",
          "passwordResetSuccessfully": "تم تعيين كلمة المرور بنجاح",
          "problem": "هناك مشكلة",
          "noInternet": "للأسف قد تعذر الإتصال بالأنترنت. يرجى التحقق من فضلك.",
          "tryAgain": "أعد المحاولة",
          "requestsAndComplaints": "الطلبات و الشكاوي",
          "classTime": "مواعيد التدريب",
          "subscriptionUpgrade": "ترقية الاشتراك",
          "language": "اللغة",
          "rating": "التقييمات",
          "logout": "تسجيل الخروج",
          "deleteAccount": "حذف حسابي",
          "save": "حفظ",
          "changePassword": "تغيير كلمة المرور",
          "lastPassword": "كلمة المرور السابقة",
          "newPassword": "كلمة المرور الجديدة",
          "requests": "الطلبات",
          "complaints": "الشكاوي",
          "requestTitle": "تم تجديد اشتراكك بنجاح",
          "requestBody": "هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي..",
          "complaintsTitle": "الرد على شكوى نظام التهوية",
          "complaintsBody": "هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي..",
          "sendRequest": " ارسال طلب ",
          "sendComplaint": "ارسال شكوى",
          "requestAddress": "عنوان الطلب",
          "AddressHint": "اكتب العنوان هنا من فضلك",
          "complaintsAddress": "عنوان الشكوى",
          "topic": "الموضوع",
          "requestTopic": "اكتب موضوع الطلب",
          "complaintTopic": "اكتب موضوع الشكوى",
          "ConfirmUpgrade": "تأكيد الترقية",
          "goToGemToApprove": "يرجى التوجه الى مقر النادي لتأكيد  عملية الترقية ودفع المبلغ",
          "ok": "موافق",
          "classTimeHint": "هنا تجد مواعيد الحصص المخصصة لك حسب اشتراكك",
          "classTimeBody": "المدرب : محمد   الحصة: نايكواندو  مدة الحصة :60 دقيقة  ",
          "requestPostponement": "طلب تأجيل",
          "postponementReason": "سبب التأجيل",
          "postponementReasonAddress": "اكتب العنوان الرئيسي لطلب التأجيل",
          "date": "التاريخ",
          "time": "الوقت",
          "otherDetails": "تفاصيل اخرى",
          "otherDetailsHint": " اكتب هنا تفاصيل التأجيل ",
          "send": "ارسال",
          "ratingTitle": "التقييم الخاص بشهر يناير",
          "ratingBodyCosplay": "انقر لاظهار البيانات",
          "ratingAttendeesTitle": "الحضور : ",
          "ratingAttendeesBody": "تقييمك في الحضور هو 3  من  5",
          "ratingObligationDressTitle": "الالتزام بالزي",
          "ratingObligationDressBody": "تقييمك في : الالتزام بالزي هو 3  من  5",
          "ratingObligationTrainingTitle": "الالتزام بالتمرينات:",
          "ratingObligationTrainingBody": "تقييمك في الالتزام بالتمرينات هو 3  من5",
          "ratingLiteratureAndEthicsTitle": "الادب والأخلاق :",
          "ratingLiteratureAndEthicsBody": "تقييمك في  الادب والأخلاق هو 3  من  5",
          "coachNoteTitle": ": ملاحظات أخرى من المدرب",
          "coachNoteBody": "هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن ال",
          "logoutPopUpText": "هل انت متأكد من تسجيل الخروج",
          "yes": "نعم",
          "cancel": "الغاء الأمر",
          "deleteAccountTextTitle": "هل انت متأكد من حذف الحساب",
          "deleteAccountTextBody": "هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي.. هناك حقيقة مثبتة منذ زمن طويل  وهي أن ال",
          "deleteAccountCheckBox": "نعم متأكد من رغبتي بحذف الحساب",
          "confirm": "تأكيد",
          "user": "المستخدم",
          "notification": "الاشعارات",
          "qrCode": "qrCode",
          "offer": "العروض",
          "home": "الرئيسية",
          "markAsRead": "تحديد الكل كمقروء",
          "noNotification": "لا يوجد اشعارات حاليا",
          "notificationTitle": "اقترب الموعد على نهاية اشتراكك",
          "notificationBody": "هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي..",
          "noOffer": "لا يوجد عروض حاليا",
          "offerTitle": "عرض جديد",
          "offerBody": "هناك حقيقة مثبتة منذ زمن طويل  وهي أن المحتوى  المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي..",
          "takeOfferButton": "طلب استفادة من العرض",
          "takeOfferSnackBar": "تم تقديم الطلب بنجاح",
          "homeTopText1": "مساء الخير  , يوسف نعمان الجزار",
          "homeTopText2": "موعد التدريب القادم : غداً , الساعة 10 صباحاً",
          "homeTopText3": "موعد تجديد اشتراكك الحالي : 01/02/2023 م",
          "numberOfPostponement": "عدد التأجيلات المتبقية :",
          "playerLevel": "مستواك هو ",
          "Beginner": "مبتدأ",
          "middle": "متوسط",
          "expert": "خبير",

        },
        "en": {
          "login": "Login",
          "changeDisplayLang": "Change Display Language",
          "next": "Next",
          "skip": "skip",
          "onBoardingText1": "Your Child's Excellence is Our Responsibility",
          "onBoardingBody1":
              "Continuing to exercise makes you a person of iron with full activity and vitality..and helps your mind focus on all aspects of your daily life.",
          "onBoardingText2": "Creating Future Champions",
          "onBoardingBody2":
              "A lot of activities, including basketball, football, taekwondo, taekwondo, boxing, gymnastics",
          "onBoardingText3": "We help you achieve your goal",
          "onBoardingBody3":
              "It's not just punches and kicks🥋 We create the best version of your child💪 2021 champions across the Kingdom.",
          "email": "Email",
          "password": "password",
          "rememberMe": "remember me",
          "forgotPassword": "Forgot your password?",
          "dontHaveAccount": "You don't have an account?",
          "makeAccount": "Create your account now",
          "emailOrPasswordError": "The email or password is incorrect",
          "helloUser": "Welcome, Youssef El-jazzar.",
          "helloAgain": "Welcome back",
          "areYouReady": "Are you ready to start",
          "goToHome": "go to home",
          "register": "Create your account",
          "haveAccount": "Have an account?",
          "tryLogin": "Log in to your account",
          "thisEmailRegister": "This email is already registered",
          "completeRegister": "Welcome, complete the registration process",
          "welcome": "Welcome!",
          "whatCategory": "Which category would you like to join",
          "sport": " Sport ",
          "cultural": "cultural",
          "continue": "Continue",
          "Karate": "Karate",
          "Gymnastics": "Gymnastics",
          "taekwondo": "taekwondo",
          "drawing": "drawing",
          "font": "font",
          "Sculpture": "Sculpture",
          "termsAndConditions": "Terms and Conditions",
          "Instructions":
              "Instructions and conditions that must be adhered to by the subscriber in the lounge",
          "termBody": '''
1- Adhere to the full sports uniform.
2- Maintaining the cleanliness of the hall.
3- Meals are not allowed inside the hall.
4- Not taking children.
5- In the event of non-compliance with the Islamic rules and ethics in the hall, the hall has the right to permanently cancel membership and not to refund the subscription amount.
6- Subscription membership fees are completely non-refundable in any case, and in the event that renewal fees are not paid on time, membership is considered terminated.
7- In the event of participation and non-attendance, the subscription is valid and does not stop unless the center management is notified, and the subscription after the expiry of the period is considered expired.
8- It is not permissible to exchange the subscription for any other individual, and in the event that the subscriber does not wish to continue in any case, the amount will not be returned at all.
9- The customer has the right to suspend his subscription for 2 training sessions with a one-month subscription, and 6 training sessions with a three-month subscription.
10- To stop the subscription, you must contact the management of the center by sending a message or calling.
11- The center has the right to photograph the training sessions for the participants during the training and publish them on the social networking accounts of the center 
                         ''',
          "agreeTerm": "I agree to all terms and conditions",
          "mandatoryField": "This field is required",
          "personalDetails": "Personal Data",
          "userName": "Subscriber's Name",
          "DOB": "Date of Birth",
          "mobileNumber": "phone number",
          "changePhoto": "Change Profile Picture",
          "openCamera": "open the camera",
          "openGallery": "Select from Gallery",
          "or": "or",
          "weAreClose": "We're almost there",
          "tellUsDiseases": "If you suffer from some diseases, tell us",
          "iHaveDiseases": "I suffer from some diseases",
          "iDontHaveDisease": "No, I am healthy and free of diseases",
          "choseDisease": "Select from the list the type of disease",
          "diabetes": "diabetes",
          "pressure": "pressure",
          "anemia": "anemia",
          "muscleTear": "muscle tear",
          "heartDisease": "Heart Disease",
          "other": "other",
          "choseCoach": "Choose Coach",
          "choseFavCoach": "Select from the list, the coach whose students you want to join",
          "sportSection": "Sports Section",
          "culturalSection": "Cultural Section",
          "coach1": "Coach Mohamed",
          "coach2": "Coach Khaled",
          "coach3": "Ahmed Coach",
          "coachClassDay": "Coach Mohammed's Classes",
          "ClassDays": "Saturday/Monday/Wednesday",
          "availableTime": "Available Class Timings",
          "availableTimeHint": "Choose the right time",
          "lastStep": "One last step left",
          "chosePackage": "Choose the right package for you",
          "month": "one month",
          "month2": "two months",
          "month3": "three months",
          "packageDetails": "Subscription details are listed here",
          "RS": "Saudi Riyal",
          "orderUnderReview": "Your request is under review. From the administration, please go to the club's headquarters to install the subscription as soon as possible.",
          "moveToLogin": "Go to log in",
          "didYouForgotPassword": "Forgot your password?",
          "sentVerification": "Send Verification Code",
          "codeWasSend": "The code has been sent to the email",
          "enterCode":"Enter verification code",
          "sendCodeAgain": "You can request a resend code within ",
          "seconds": "seconds ",
          "verification": "verify",
          "typeNewPassword": "Enter your new password",
          "retypePassword": "Retype Password",
          "passwordReset": "Password Reset",
          "passwordResetSuccessfully": "Password set successfully",
          "problem": "there is a problem",
          "noInternet": "Unfortunately, it is not possible to connect to the Internet. Please check.",
          "tryAgain": "try again",
          "requestsAndComplaints": "RequestsAndComplaints",
          "classTime": "training times",
          "subscriptionUpgrade": "Subscription Upgrade",
          "language": "language",
          "rating": "ratings",
          "logout": "logout",
          "deleteAccount": "Delete my account",
          "save": "save",
          "changePassword": "Change Password",
          "lastPassword": "the previous password",
          "newPassword": "new password",
          "requests": "requests",
          "complaints": "complaints",
          "requestTitle": "Your subscription has been renewed successfully",
          "requestBody": "There is a long-established fact that the readable content of a page will not distract the reader from focusing on the external appearance....",
          "complaintsTitle": "Response to Ventilation System Complaint",
          "complaintsBody": "There is a long-established fact that the readable content of a page will not distract the reader from focusing on the external appearance..",
          "sendRequest": "send a request",
          "sendComplaint": "Send Complaint",
          "requestAddress": "Request Address",
          "AddressHint": "Type address here please",
          "complaintsAddress": "Complaint Address",
          "topic": "topic",
          "requestTopic": "Type the subject of the request",
          "complaintTopic": "Type the subject of the complaint",
          "ConfirmUpgrade": "Confirm Upgrade",
          "goToGemToApprove": "Please go to the club's headquarters to confirm the upgrade and pay the amount",
          "ok": "OK",
  "classTimeHint": "Here you will find the class times assigned to you according to your subscription",
  "classTimeBody":" Coach: Mohamed Class: taekwondo Class Duration: 60 minutes",
  "requestPostponement": "Request Postponement",
  "postponementReason": "The reason for the delay",
  "postponementReasonAddress": "Type the main address for the postponement request",
  "date": "date",
  "time": "time",
  "otherDetails": "Other Details",
  "otherDetailsHint": "Write delay details here",
  "send": "send",
  "ratingTitle": "January Rating",
  "ratingBodyCosplay": "Click to show data",
  "ratingAttendeesTitle": "Attendance: ",
  "ratingAttendeesBody": "Your audience rating is 3 out of 5",
  "ratingObligationDressTitle": "Dress Obligation",
  "ratingObligationDressBody": "Your rating on Dress Obligation is 3 out of 5",
  "ratingObligationTrainingTitle": "Exercise adherence:",
  "ratingObligationTrainingBody": "Your rating for adherence to exercise is 3 out of 5",
  "ratingLiteratureAndEthicsTitle": "Literature and Ethics:",
  "ratingLiteratureAndEthicsBody": "Your rating LiteratureAndEthicsBody is 3 out of 5",
  "coachNoteTitle": ": Other notes from the trainer",
  "coachNoteBody": "There is a proven fact from a long time ago that the readable content of a page will not distract the reader from focusing on the external appearance.. There is a proven fact from a long time ago, which is that the readable content of a page will not distract the reader from focusing on the external appearance.. There is a proven fact a long time ago and it is that the",
  "logoutPopUpText": "Are you sure you are logged out",
  "yes": "yes",
  "cancel": "to cancel",
  "deleteAccountTextTitle": "Are you sure to delete the account",
  "deleteAccountTextBody": "There is a long-established fact that the readable content of a page will not distract the reader from focusing on the external appearance.. There is a long-established fact that the readable content of a page will not distract the reader from focusing on the external appearance.. There is a proven fact a long time ago and it is that the",
  "deleteAccountCheckBox": "Yes, I'm sure I want to delete the account",
  "confirm": "confirm",

          "user": "user",
          "notification": "notifications",
          "qrCode": "QR Code",
          "offer": "offers",
          "home": "home",
          "markAsRead": "Mark all as read",
          "noNotification": "There are currently no notifications",
          "notificationTitle": "Your subscription is coming to an end",
          "notificationBody": "There is a long-established fact that the readable content of a page will not distract the reader from focusing on the external appearance..",
          "noOffer": "There are currently no offers",
          "offerTitle": "New Offer",
          "offerBody": "There is a long-established fact that the readable content of a page will not distract the reader from focusing on the external appearance..",
          "takeOfferButton": "take offer",
          "takeOfferSnackBar": "Request submitted successfully",
          "homeTopText1": "Good evening, Youssef Noman El-jazzar",
          "homeTopText2": "Next training time: tomorrow, 10 am",
          "homeTopText3": "Your current subscription renewal date: 01/02/2023",
          "numberOfPostponement": "Number of Postponements Left:",
          "playerLevel": "Your level is",
          "Beginner": "Beginner",
          "middle": "middle",
          "expert": "expert",

        }
      };
}
