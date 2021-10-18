
let obj = {
    startDate: '2018-07-00 10시 00분', // 직접 설정 호스팅사 마다 입력양식 다릅니다.
    endDate: '2030-12-15 9시 59분', // 직접 설정 호스팅사 마다 입력양식 다릅니다.
    guageEl: '.guage',
    el: '#timeSale01', // dateEl을 감싸도록 설정하세요.
    dateEl: '.dateSaleHeader',
}

let timesale01 = new timeSale(obj)


function timesale(opt){
    this.$name = 'a'
    nowSec = new Date().getTime()
}

console.log(timesale01)