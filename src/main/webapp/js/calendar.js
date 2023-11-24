document.addEventListener('DOMContentLoaded', function() {
  const renderCalendar = (year, month) => {
    const months = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
    const currentDate = document.querySelector('.current-date');
    const daysTag = document.querySelector('.days');
    const lastDateofMonth = new Date(year, month + 1, 0).getDate();
    const firstDayofMonth = new Date(year, month, 1).getDay();
    currentDate.textContent = `${year}년 ${months[month]}`;

    let prevMonthDays = '';
    for (let i = firstDayofMonth; i > 0; i--) {
      prevMonthDays += `<li class="prev-date">${new Date(year, month, -i + 1).getDate()}</li>`;
    }

    let liTag = '';
    for (let i = 1; i <= lastDateofMonth; i++) {
      liTag += `<li class="selectable">${i}</li>`;
    }

    daysTag.innerHTML = prevMonthDays + liTag;
    const selectableDays = document.querySelectorAll('.selectable');
    const selDate = document.querySelector('.selDate');
    
    selectableDays.forEach(day => {
      day.addEventListener('click', () => {
        const selectedDate = `${year}-${month}-${day.textContent}`;
    
        if (day.classList.contains('selected')) {
          day.classList.remove('selected');
          selDate.innerHTML = '';
        } else {
          const selected = document.querySelector('.selected');
          if (selected) {
            selected.classList.remove('selected');
          }
          const selDate = document.querySelector('.selDate');
          day.classList.add('selected');
          // alert(`선택된 날짜: ${selectedDate}`);
          selDate.innerHTML = selectedDate;
        }
      });
    });
    
  }

  let date = new Date();
  let currYear = date.getFullYear();
  let currMonth = date.getMonth();

  const prevButton = document.getElementById('prev');
  const nextButton = document.getElementById('next');

  const disablePrevButton = () => {
    prevButton.classList.add('none');
    prevButton.disabled = true;
  }

  const enablePrevButton = () => {
    prevButton.classList.remove('none');
    prevButton.disabled = false;
  }

  prevButton.addEventListener('click', () => {
    currMonth = currMonth - 1 < 0 ? 11 : currMonth - 1;
    if (currMonth === 11) {
      currYear -= 1;
    }
    renderCalendar(currYear, currMonth);
    if (currYear === date.getFullYear() && currMonth === date.getMonth()) {
      disablePrevButton();
    } else {
      enablePrevButton();
    }
  });

  nextButton.addEventListener('click', () => {
    currMonth = currMonth + 1 > 11 ? 0 : currMonth + 1;
    if (currMonth === 0) {
      currYear += 1;
    }
    renderCalendar(currYear, currMonth);
    enablePrevButton();
  });

  renderCalendar(currYear, currMonth);
  disablePrevButton(); // 초기에 이전 버튼 비활성화
});