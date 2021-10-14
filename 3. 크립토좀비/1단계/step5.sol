pragma solidity ^0.4.19;

// 배열 
/*
    javascript 기준 배열은 
    A라는 변수를 배열로 사용하고싶다 라고하면
    A = [] 입니다
    만약에 A라는 변수에 5개만 담고싶다면 ? length 값이 6이 된다면 에러가 나게 하고싶다.. 라면 어떻게 해야할까요
    네 직접 length을 확인해주는 코드를 작성해줘야합니다.

    하지만 대부분 컴파일 언어는 배열에 미리 길이 즉 사용공간을 지정해줍니다. 이유는 바로 메모리 인데요.
    내가 앞으로 배열을 int타입으로 사용할것이며, 총 5개를 만들겠다 라고 한다면

    uint[5] a; 라고 선언할수있으며;
    
    이번엔 글자형으로 만들고싶다면

    string[5] a; 라고 선언 할수있습니다.

    하지만 배열이란게 사용할때 무한으로 넣고싶을만큼 팍팍 넣고싶을때도 있죠; 넣는 갯수는 무한으로 할수있지만 (그 무한이라는것이.. 1조억개들어갈수있다는게 아님.)
    타입은 마음대로 바꿀수는없습니다.

    uint[] a; 이렇게 여러개 넣을수도 있습니다. 이런걸 동적배열이라고하고요.

    길이를 고정시키는것인 정적배열이라고합니다.

    그래서 배열 선언할시 앞에 데이터 타입을 넣는 것이 일반적인데요.

    사실 구조체 또한 배열로 생성할수 있습니다. 
    javascript로 치면 객체를 담은 배열이다 라는 듯이되겠네요?

    [
        {name:'ingoo'},{name:'ingoo2'} ... 등등
    ]

    이것은 solidity 언어로 구현 해보자면.

    방금만들었떤 struct를 이용해서
    
    struct person {
        string name;
        uint age;
    }

    //데이터타입 변수명
    person[] people; // 동적 배열로 , 원소를 계속적으로 객체(?) 형태로 추가할수 있습니다.
 */

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;
}