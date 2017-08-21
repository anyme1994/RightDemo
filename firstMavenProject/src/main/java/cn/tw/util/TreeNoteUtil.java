package cn.tw.util;

public class TreeNoteUtil {
	/*public  static List<Menu> getFatherNode(List<Menu> treesList){
        List<Menu> newTrees = new ArrayList<>();
        for (Menu item : treesList) {
        	//如果上级ID为空，则该节点为父节点
            if (StringUtil.isEmpty(item.getPid())) {
                //获取父节点下的子节点
            	item.setChildren(getChildrenNode(item.getId(), treesList));
                newTrees.add(item);
            }
        }
        return newTrees;
    }
	private  static List<Menu> getChildrenNode(String pId, List<Menu> treesList){
        List<Menu> newTrees = new ArrayList<Menu>();
        for (Menu item : treesList) {
            if (StringUtil.isEmpty(item.getPid())) continue;
            if(item.getPid().equals(pId)){
                //递归获取子节点下的子节点，即设置树控件中的children
                item.setChildren(getChildrenNode(item.getId(), treesList));
                //Map<String, Object> map = new HashMap<String, Object>();
                newTrees.add(item);
            }
        }
        return newTrees;
    }*/
	private static final void bubo(){
    }
}
