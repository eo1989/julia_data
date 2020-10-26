# A simple binary search algorithm to test lsp and snippets

function binarysearch(lst::Vector{T}, val::T) where T
    low = 1
    high = length(lst)
    while low <= high
        mid = (low + high) ÷ 2
        if lst[mid] > val
            high = mid - 1
        elseif lst[mid] < val
            low = mid + 1
        else
            return mid
        end
    end
    return 0
end

println(binarysearch([1, 5, 7, 9, 10, 15, 17, 22, 26, 28], 10))
