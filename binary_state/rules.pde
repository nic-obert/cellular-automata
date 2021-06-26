

void rule1(int nearCount, int x, int y)
{
	if (nearCount > 4)
    {
        matrix[x][y] = 0;
    }
    else if (nearCount > 1)
    {
        matrix[x][y] = 1;
    }
    else if (nearCount < 2)
    {
        matrix[x][y] = 0;
    }
}


void rule2(int nearCount, int x, int y)
{
	if (nearCount > 3)
    {
        matrix[x][y] = 0;
    }
    else if (nearCount > 1)
    {
        matrix[x][y] = 1;
    }
    else if (nearCount < 2)
    {
        matrix[x][y] = 0;
    }
}


void rule3(int nearCount, int x, int y)
{
	if (nearCount > 2)
    {
        matrix[x][y] = 0;
    }
    else if (nearCount > 1)
    {
        matrix[x][y] = 1;
    }
    else if (nearCount < 1)
    {
        matrix[x][y] = 0;
    }
}


void rule4(int nearCount, int x, int y)
{
	if (nearCount > 2)
    {
        matrix[x][y] = 0;
    }
    else if (nearCount > 0)
    {
        matrix[x][y] = 1;
    }
    else if (nearCount < 1)
    {
        matrix[x][y] = 0;
    }
}

