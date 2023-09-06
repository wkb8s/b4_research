sample_list = [['要素1', '要素2'], ['要素3', '要素4'], ['要素5', '要素6'], ['要素7', '要素8']]
print(sample_list)

print('・remove()で2次元リストの要素を取り除く')
sample_list[0].remove('要素1')
sample_list[3].remove('要素8')
sample_list[3].remove('要素7')
sample_list.remove('要素1')
print(sample_list)
