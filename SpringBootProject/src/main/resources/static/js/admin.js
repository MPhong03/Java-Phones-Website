function addNameAndValue() {
    const nameInput = document.getElementById('nameInput').value.trim();
    const valueInput = document.getElementById('valueInput').value.trim();
    const dataTableBody = document.getElementById('dataTableBody');

    if (nameInput && valueInput) {
        // Tạo một hàng mới trong bảng hiển thị
        const row = document.createElement('tr');
        const nameCell = document.createElement('td');
        const valueCell = document.createElement('td');

        nameCell.textContent = nameInput;
        valueCell.textContent = valueInput;

        row.appendChild(nameCell);
        row.appendChild(valueCell);

        dataTableBody.appendChild(row);

        // Clear input fields after adding the row
        document.getElementById('nameInput').value = '';
        document.getElementById('valueInput').value = '';

        // Cập nhật giá trị values vào phần tử input ẩn
        updateValuesInput();
    }
}

function updateValuesInput() {
    const nameElements = document.querySelectorAll('#dataTableBody td:first-child');
    const valueElements = document.querySelectorAll('#dataTableBody td:nth-child(2)');
    const nameValueArray = [];

    for (let i = 0; i < nameElements.length; i++) {
        const name = nameElements[i].textContent;
        const value = valueElements[i].textContent;
        console.log(`${name}_${value}`);
        nameValueArray.push(`${name}_${value}`);
    }

    // Cập nhật giá trị values vào phần tử input ẩn
    document.getElementById('valuesInput').value = nameValueArray.join(';');
}
