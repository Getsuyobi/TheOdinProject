def bubble_sort(array)
    sorted = false
    tmp = 0
    while !sorted
        sorted = true
        array.each_with_index do |elt, i|
            if i != array.length-1 && elt > array[i+1]
                array[i], array[i+1] = array[i+1], array[i]
                sorted = false
            end
        end
    end
    array
end

p bubble_sort([4,3,78,2,0,2])