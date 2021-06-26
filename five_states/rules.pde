

void rule1(int nearCount, int x, int y)
{
	if (nearCount > 25 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
    else if (nearCount > 11 && matrix[x][y] < 5)
    {
        matrix[x][y] ++;
    }
    else if (nearCount < 6 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
}


void rule2(int nearCount, int x, int y)
{
	if (nearCount > 14 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
    else if (nearCount > 11 && matrix[x][y] < 5)
    {
        matrix[x][y] ++;
    }
    else if (nearCount < 6 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
}


void rule3(int nearCount, int x, int y)
{
	if (nearCount > 12 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
    else if (nearCount > 9 && matrix[x][y] < 5)
    {
        matrix[x][y] ++;
    }
    else if (nearCount < 5 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
}


void rule4(int nearCount, int x, int y)
{
	if (nearCount > 9 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
    else if (nearCount > 5 && matrix[x][y] < 5)
    {
        matrix[x][y] ++;
    }
    else if (nearCount < 4 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
}


void rule5(int nearCount, int x, int y)
{
	if (nearCount > 5 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
    else if (nearCount > 2 && matrix[x][y] < 5)
    {
        matrix[x][y] ++;
    }
    else if (nearCount < 1 && matrix[x][y] > 0)
    {
        matrix[x][y] --;
    }
}

