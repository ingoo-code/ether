  /*---- Time sale ----*/
  getCatetoryDisplyContainer({
    "code": '043',// [/]로 2차,3차 카테고리 구분
    "page": 1,
    "id": 1,
    "limit": 4,
    "iosLimit": 0,
    "img": "img_s", // img_mobile, img_l, img_m, img_s
    "caching": false,
    "sort": "manual", // manual(사용자정의), order(최신순), price(낮은가격), price2(높은가격), brandname(이름순), sellcnt(판매순), review(리뷰순)
    "showList": "get_list", // 분류 get_recmd_product_list(추천), get_best_product_list(베스트), get_promotion_product_list(프로모션)
 });
 setTimeout(function () {
    // 타임세일
    var timeSale01 = new timeSale({
       startDate: '2018-07-00 10시 00분', // 직접 설정 호스팅사 마다 입력양식 다릅니다.
       endDate: '2030-12-15 9시 59분', // 직접 설정 호스팅사 마다 입력양식 다릅니다.
       guageEl: '.guage',
       el: '#timeSale01', // dateEl을 감싸도록 설정하세요.
       dateEl: '.dateSaleHeader',
       // noSaleEl: '.noSale',
    });
    // 종료 테스트
    // timeSale01.endTest();
 }, 1000);
 /*---- Time sale ----*/